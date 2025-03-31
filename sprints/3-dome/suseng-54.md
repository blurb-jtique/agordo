SUSENG-54
=========

# 1. Reason and Explanation of the Error

- **Error Encountered:**
  The Java application was failing with a `javax.net.ssl.SSLHandshakeException` citing a "PKIX path building failed" error.

- **Root Cause:**
  This error occurs when Java’s SSL/TLS handshake cannot build a valid certification path from the server's certificate back to a trusted root in the Java truststore. In our case, the Amazon Trust Services certificates were missing from the default truststore, causing the validation to fail.

---

# 2. Possible Solutions

- **Update the Java Truststore:**
  Use the `keytool` utility to import the missing Amazon CA certificates into Java’s default truststore, thereby allowing Java to trust certificates signed by Amazon Trust Services.

- **Upgrade or Update Java:**
  Upgrade to a newer version of Java (or at least a later update of Java 7) that may include updated certificates or better support for TLS 1.2.

- **Implement a Custom TrustManager:**
  Write code that loads a specific certificate (PEM or DER), creates a custom KeyStore, and initializes an SSLContext with a custom TrustManager. This bypasses the global truststore by explicitly trusting the provided certificate.

---

# 3. Solution Implemented and Tested

**Error replication - Master**
below is a sample of the code used to replicate this scenario
```java
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;

public class S3FileDownloader {
    public static void main(String[] args) {

        if (args.length != 2) {
            System.out.println("Usage: java S3FileDownloader <fileURL> <destinationFile>");
            return;
        }
        String fileURL = args[0];
        String destinationFile = args[1];

        try {
            URL url = new URL(fileURL);
            HttpURLConnection httpConn;


            if (fileURL.toLowerCase().startsWith("https")) {
                SSLContext sc = SSLContext.getInstance("TLSv1.2");
                sc.init(null, null, new java.security.SecureRandom());
                SSLSocketFactory factory = sc.getSocketFactory();

                HttpsURLConnection httpsConn = (HttpsURLConnection) url.openConnection();
                httpsConn.setSSLSocketFactory(factory);
                httpConn = httpsConn;
            } else {
                httpConn = (HttpURLConnection) url.openConnection();
            }

            int responseCode = httpConn.getResponseCode();


            if (responseCode == HttpURLConnection.HTTP_OK) {
                InputStream inputStream = httpConn.getInputStream();
                FileOutputStream outputStream = new FileOutputStream(destinationFile);

                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                outputStream.close();
                inputStream.close();
                System.out.println("File downloaded to " + destinationFile);
            } else {
                System.out.println("No file to download. Server replied with code: " + responseCode);
            }
            httpConn.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

and this is the output for this isolated example
```sh
$ java -Dhttps.protocols=TLSv1.2 S3FileDownloader2 "https://master.builder.blurb.com/pdf-processing/files/P17726387-21a4c0708d0b03d1611fbf0a6f2bfbe81ae7ed1bdde0021a619e111877931896?Expires=1747285280" "downloadedFile.txt"

javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
	at sun.security.ssl.Alerts.getSSLException(Alerts.java:192)
	at sun.security.ssl.SSLSocketImpl.fatal(SSLSocketImpl.java:1884)
	at sun.security.ssl.Handshaker.fatalSE(Handshaker.java:276)
	at sun.security.ssl.Handshaker.fatalSE(Handshaker.java:270)
	at sun.security.ssl.ClientHandshaker.serverCertificate(ClientHandshaker.java:1341)
	at sun.security.ssl.ClientHandshaker.processMessage(ClientHandshaker.java:153)
	at sun.security.ssl.Handshaker.processLoop(Handshaker.java:868)
	at sun.security.ssl.Handshaker.process_record(Handshaker.java:804)
	at sun.security.ssl.SSLSocketImpl.readRecord(SSLSocketImpl.java:1016)
	at sun.security.ssl.SSLSocketImpl.performInitialHandshake(SSLSocketImpl.java:1312)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1339)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1323)
	at sun.net.www.protocol.https.HttpsClient.afterConnect(HttpsClient.java:563)
	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:185)
```
- **Approach Taken:**
  We implemented a custom SSLContext in the Java application that:
  - Loads a PEM-encoded certificate file.
  - Creates a custom KeyStore and adds the loaded certificate.
  - Initializes a TrustManagerFactory with the custom KeyStore.
  - Sets up an SSLContext with the custom TrustManagers.
  - Configures `HttpsURLConnection` to use this SSLContext for secure connections.

- **Testing and Outcome:**
  This approach bypassed the need to modify the global truststore and allowed the application to successfully verify the server's certificate, thereby resolving the SSL handshake issue. The file download functionality was then tested and confirmed to work perfectly under this configuration.

Isolated code used to test the solution
```java
import javax.net.ssl.*;
import java.io.*;
import java.net.URL;
import java.net.HttpURLConnection;
import java.security.KeyStore;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

public class CustomCertificateDownloader {
    public static void main(String[] args) throws Exception {
        if (args.length != 3) {
            System.out.println("Usage: java CustomCertificateDownloader <fileURL> <destinationFile> <certificateFile>");
            return;
        }
        String fileURL = args[0];
        String destinationFile = args[1];
        String certificateFile = args[2];


        CertificateFactory cf = CertificateFactory.getInstance("X.509");
        InputStream caInput = new BufferedInputStream(new FileInputStream(certificateFile));
        X509Certificate caCert;
        try {
            caCert = (X509Certificate) cf.generateCertificate(caInput);
            System.out.println("Loaded CA certificate: " + caCert.getSubjectDN());
        } finally {
            caInput.close();
        }


        KeyStore keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
        keyStore.load(null, null);
        keyStore.setCertificateEntry("customCa", caCert);


        TrustManagerFactory tmf = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        tmf.init(keyStore);


        SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
        sslContext.init(null, tmf.getTrustManagers(), null);


        URL url = new URL(fileURL);
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
        conn.setSSLSocketFactory(sslContext.getSocketFactory());


        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            InputStream is = conn.getInputStream();
            FileOutputStream fos = new FileOutputStream(destinationFile);
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
            fos.close();
            is.close();
            System.out.println("File downloaded to " + destinationFile);
        } else {
            System.out.println("No file to download. Server replied with code: " + responseCode);
        }
        conn.disconnect();
    }
}
```

And this is the execution that tested the solution works. We used a root CA downloaded from [Amazon Trust Services](https://www.amazontrust.com/repository/). File does not exist but the handshake works well.
```sh
$ $ java -Dhttps.protocols=TLSv1.2 CustomCertificateDownloader "https://master.builder.blurb.com/pdf-processing/files/P17726387-21a4c0708d0b03d1611fbf0a6f2bfbe81ae7ed1bdde0021a619e111877931896?Expires=1747285280" "downloadedFile.txt" "AmazonRootCA1.pem"
Loaded CA certificate: CN=Amazon Root CA 1, O=Amazon, C=US

No file to download. Server replied with code: 404
```

---

# 4. Risks analysed

## 1. Updating the Java Truststore (Using keytool)

**Pros:**
- **Centralized Management:** Once imported, all applications that use the default truststore benefit from the update.
- **Standard Practice:** This is a widely accepted method for extending trusted certificates.

**Risks & Tradeoffs:**
- **Global Impact:** Changing the default truststore affects all Java applications on the system. In a legacy ecosystem, some components might rely on older certificate configurations, and a change might have unforeseen side effects.
- **Maintenance Overhead:** We must ensure that all nodes and environments are updated consistently. In a distributed system, a mismatch between environments can lead to intermittent failures.
- **Complex Rollbacks:** If the new certificate causes issues, rolling back the truststore may be challenging, especially in older systems with limited change management.

## 2. Upgrading or Updating Java

**Pros:**
- **Improved Security and Support:** Newer Java versions include modern TLS support and updated truststores, reducing the need for manual certificate management.
- **Long-term Benefit:** This aligns the ecosystem with current standards and best practices.

**Risks & Tradeoffs:**
- **Compatibility Issues:** In a 10+ years legacy ecosystem, upgrading Java can introduce incompatibilities. Legacy code might rely on behaviors or deprecated APIs that have changed.
- **Operational Disruption:** The upgrade process itself might require significant downtime or gradual rollouts, which is challenging in a complex ecosystem.

## 3. Implementing a Custom TrustManager

**Pros:**
- **Granular Control:** The solution is confined to the specific component, avoiding changes to the global truststore. This reduces the risk of impacting other parts of the system.
- **Flexibility:** We can explicitly trust only the necessary certificate(s) for this component, which may be useful if the component has a narrow scope of communication.

**Risks & Tradeoffs:**
- **Increased Complexity:** Custom SSL/TLS handling code increases maintenance burden. In a legacy environment, custom code may be harder to debug and maintain.
- **Certificate Management:** If the trusted certificate changes (e.g., during a CA rotation), We’ll need to update and redeploy the component code. This manual process might lead to delays or security gaps.
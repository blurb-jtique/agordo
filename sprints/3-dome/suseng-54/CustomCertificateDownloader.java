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
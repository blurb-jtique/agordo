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
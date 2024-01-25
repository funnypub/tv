import java.io.*;

public class FixTv {


    public static final String ORI_FILE = "E:\\Documents\\iptv.m3u";
    public static final String FIX_FILE = "E:\\Documents\\iptv.txt";

    public static void main(String[] args) {
        try {
            readFile();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void readFile() throws Exception {

        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(ORI_FILE), "UTF-8"));

        int lineNumber = 0;

        int extInfLine = 0;

        String lineContent;

        StringBuffer stringBuffer = new StringBuffer();

        while ((lineContent = bufferedReader.readLine()) != null) {
            lineNumber++;
            if (lineContent.contains("EXTINF")) {
                extInfLine = lineNumber;
                String[] split = lineContent.split(",");
                String extInfStr = split[1];

                System.out.print(extInfStr + ",");
                stringBuffer.append(extInfStr).append(",");
            }

            if (lineNumber == (extInfLine + 1) && (lineContent.contains("http"))) {
                System.out.println(lineContent);
                stringBuffer.append(lineContent).append("\n");
            }
        }

        writeFile(stringBuffer);

    }

    public static void writeFile(StringBuffer stringBuffer) throws Exception {
        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(FIX_FILE), "UTF-8"));
        bufferedWriter.write(stringBuffer.toString());

        bufferedWriter.close();


    }


}

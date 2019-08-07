package websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import databean.AlarmDataBean;
import dbbean.SearchDao;

@ServerEndpoint( "/websocket/chat" )
public class ChatServer {
   private String prefix = "Guest";
   private static int cnt = 0;
   private static List<ChatServer> clients = new ArrayList<ChatServer>();
   private Session session;
   private String name;
   
   @Resource
   private SearchDao searchDao;
   
   public ChatServer() {
      String threadName = "Thread Name : " + Thread.currentThread().getName();
      name = prefix + " " + ++cnt;
      System.out.println( threadName + " : " + name );
   }
   
   @OnOpen
   public void start( Session session ) {
      System.out.println( "클라이언트 접속 : " + session );
      this.session = session;
      clients.add( this );
      String message = name + "님이 접속했습니다";
        
   }
   
   @OnClose
   public void end() {
      clients.remove( this );
      String message = name + "님이 종료했습니다";

   }
   
   @OnMessage
   public void incoming( String msg ) {
      if( msg == null || msg.trim().equals( "" ) )
         return;
      System.out.println("메시지 받았음");
      //String message[] = msg.split("@");
      String message = msg;
      broadcast( message );
   }
   
   @OnError
   public void error( Throwable t ) throws Throwable {
      System.out.println( "에러발생 : " + t.toString() );
   }
   
   public void broadcast( String message ) {
      for( int i=0; i<clients.size(); i++ ) {
         ChatServer client = clients.get( i );
         
            
         
            try {
               synchronized( client ) {            
                  client.session.getBasicRemote().sendText( message );
               }
            } catch( IllegalStateException e ) {
               // 메세지 송신중인 동시에 수신을 하는 경우
               if( e.getMessage().indexOf( "[TEXT_FULL_WRITING]" ) != -1 ) {
                  new Thread() {
                     public void run() {
                        while( true ) {
                           try {
                              client.session.getBasicRemote().sendText( message );
                              break;
                           } catch( IllegalStateException ee ) {
                              try {
                                 Thread.sleep( 1000 );
                              } catch( InterruptedException ie ) {
                                 ie.printStackTrace();
                              }
                           } catch( IOException ie ) {
                              ie.printStackTrace();
                           }
                        }
                     }                  
                  }.start();
               }         
               
            } catch ( Exception e ) {
               System.out.println( "강제 종료 : " + e.getMessage() );
               clients.remove( this );
               
               try {
                  client.session.close();
               } catch (IOException e1) {
                  e1.printStackTrace();
               }
               
               String msg = name + "강제 종료했습니다";
               broadcast( msg );            
            }

      }
   }

} // class

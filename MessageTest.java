import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MessageTest {
	public static void main(String[] args) {
		for(int i=0;i<10;i++){
			Music m=new Music();
			Message s=new Message();
			Executor e=Executors.newFixedThreadPool(2);
			e.execute(m);
			e.execute(s);
			((ExecutorService)e).shutdown();
		}
	}
}
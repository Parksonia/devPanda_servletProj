package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

public class ImageUtil {

	// 이미지 띄우기 /image 서블릿에서 호출 
	public void imageView(HttpServletRequest request,OutputStream out,String file) throws Exception {
		FileInputStream fis = null;
		//upload폴더 경로 가져옴
		String path = request.getServletContext().getRealPath("upload");
		
		try {
			fis = new FileInputStream(new File(path,file)); //파일 읽기 시도 
			
			//읽어올 파일을 byte단위로 읽어옴 크기 설정
			byte[] buff= new byte[4096];
			int len; 
			
			while((len=fis.read(buff))>0) { //읽은 파일의 크기를len 에 저장 
				out.write(buff,0,len); // 파일 출력
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(fis !=null) fis.close(); // 파일을 성공적으로 열었기 때문에 close해야함 null이면 닫을 것도 없음 
			} catch (Exception e2) {
				 e2.printStackTrace();
			}
		}
		
	}
	
}

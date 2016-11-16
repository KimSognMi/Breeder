package com.pet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import com.dto.PetDTO;
import com.exception.CommonException;

import com.service.PetService;

/**
 * Servlet implementation class LognFormServlet
 */
@WebServlet("/PetAddServlet")
public class PetAddServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//나중에 필터로 설정하기
		request.setCharacterEncoding("UTF-8");	  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PetDTO dto =new PetDTO();
				 
				 DiskFileItemFactory factory = new DiskFileItemFactory();
				 ServletContext ctx =getServletContext();		
				File repository = (File) ctx.getAttribute("javax.servlet.context.tempdir"); // new File("c://temp") 임시파일 경로
				factory.setRepository(repository);

				
				 ServletFileUpload upload = new ServletFileUpload(factory);
			        // If file size exceeds, a FileUploadException will be thrown
				 upload.setSizeMax(1024*1024*5); //업로드 되는 전체 파일크기 제한
				 upload.setFileSizeMax(1024*1024*2); // 개별 파일의 max값 제한

			        List fileItems = null;
					try {
						fileItems = upload.parseRequest(request);
						System.out.println(">>>"+fileItems);
					} catch (FileUploadException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			        Iterator<FileItem> itr = fileItems.iterator();
			        String fileName = null;
			        
			        while(itr.hasNext()) {
			          FileItem fi = itr.next();

			          if( !fi.isFormField() ) { // input type="file" 인 경우
			        	 String p_photo = fi.getName();
			        	 dto.setP_photo(p_photo);
			            System.out.println("\nNAME: "+fi.getName());
			            System.out.println("SIZE: "+fi.getSize());
			           
			            File fullFile  = new File(fi.getName());  
			        		//File fNew = new File(ctx.getRealPath("/"),fullFile.getName());
			            /*	 
			        	 *  톰캣 가상 경로 설정하기 META-INF/context.xml
			        	 * <Resources>
			        			<PreResources className="org.apache.catalina.webresources.DirResourceSet" base="c:/Temp/upload/" webAppMount="/images" />
			        		</Resources>
			        		
			        		*
			        		*/
			                File fNew = new File("c:/Temp/upload/",fullFile.getName());
			            System.out.println("fNew >> " + fNew.getPath());
			            System.out.println(fNew.getAbsolutePath());
			            try {
							fi.write(fNew);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
			          }else { // input type="file" 아닌 경우
			            System.out.println("Field ="+fi.getFieldName()+"\t"+fi.getString("UTF-8"));  // getString("UTF-8") 지정해야 한글처리 가능
			           if("userid".equals(fi.getFieldName())){
			            	dto.setUserid(fi.getString("UTF-8"));
			            }else if("p_kkcnumber".equals(fi.getFieldName())){
			            	dto.setP_kkcnumber(fi.getString("UTF-8"));
			            }else if("p_name".equals(fi.getFieldName())){
			            	dto.setP_name(fi.getString("UTF-8"));
			            }else if("p_age".equals(fi.getFieldName())){
			            	dto.setP_age(Integer.parseInt(fi.getString("UTF-8")));
			            }else if("p_gender".equals(fi.getFieldName())){
			            	dto.setP_gender(fi.getString("UTF-8"));
			            }else if("p_birth".equals(fi.getFieldName())){
			            	dto.setP_birth(fi.getString("UTF-8"));
			            }else if("p_type".equals(fi.getFieldName())){
			            	dto.setP_type(fi.getString("UTF-8"));
			            }else if("p_feature".equals(fi.getFieldName())){
			            	dto.setP_feature(fi.getString("UTF-8"));
			            }else if("mom_kkc".equals(fi.getFieldName())){
			            	dto.setMom_kkc(fi.getString("UTF-8")); 
			            }else if("papa_kkc".equals(fi.getFieldName())){
			            	dto.setPapa_kkc(fi.getString("UTF-8")); 
			            }
			         
			          }
			        }//end while
				
     
			        PetService p_service=new PetService();
			        PetService service = new PetService();
			    
				    String title="";
				    String target="";
				    try {
				    	HttpSession session=request.getSession();
						service.addPet(dto);
						List<PetDTO> p_dto=p_service.list(dto.getUserid()); 
						session.setAttribute("list",p_dto);
						System.out.println("펫추가"+p_dto);
						target = "index.jsp";
						request.setAttribute("result", "success");
					} catch (CommonException e) {
						title= e.getMessage();
						String link="PetFormServlet";
						target="error.jsp";
						request.setAttribute("title", title);
						request.setAttribute("link", link);
					}
					
					RequestDispatcher dis =
							request.getRequestDispatcher(target);
					dis.forward(request, response);
			        
	}

}

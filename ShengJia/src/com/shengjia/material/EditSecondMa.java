package com.shengjia.material;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shengjia.dao.CategoryDBO;

/**
 * 上传更多图片
 * 
 * @author zy
 *
 */
public class EditSecondMa extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 上传文件存储目录
	private static final String UPLOAD_DIRECTORY = "upload";

	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 上传数据及保存文件
	 */

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		// 保存id号
		HttpSession session = request.getSession();
		String category = (String) session.getAttribute("category");
		String pathName = null;
		String materialname = null;
		String detail = null;
		int id = 0;
		// 检测是否为多媒体/文件上传
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 如果不是则停止
			PrintWriter writer = response.getWriter();
			writer.println("Error: 表单必须包含 enctype=multipart/form-data");
			writer.flush();
			return;
		}

		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);
		String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
		System.out.println(uploadPath);
		// 如果目录不存在则创建
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			// 解析请求的内容提取文件数据
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				// 迭代表单数据
				for (FileItem item : formItems) {
					// 处理不在表单中的字段
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator + fileName;
						System.out.println("file:" + fileName);
						File storeFile = new File(filePath);
						pathName = fileName;
						// 在控制台输出文件的上传路径
						System.out.println("文件路径：" + filePath);
						// 保存文件到硬盘
						item.write(storeFile);
					} else {
						if (item.getFieldName().equals("materialname")) {
							materialname = item.getString("utf-8");
						}
						if (item.getFieldName().equals("detail")) {
							detail = item.getString("utf-8");
						}
						if (item.getFieldName().equals("id")) {
							id = Integer.parseInt(item.getString("utf-8"));
						}
					}
				}
			}
			request.setAttribute("message", "修改成功！");
		} catch (Exception ex) {
			request.setAttribute("message", "错误信息: " + ex.getMessage());
			System.out.println("上传发生错误");
		}
		boolean b = false;
		CategoryDBO cDao = new CategoryDBO();
		/*
		 * Category sd = cDao.queryCaseByName1(materialname);
		 */ /*
			 * if ((sd.getName()) == null) { b=cDao.addCategory(category,
			 * pathName, materialname, detail);
			 * 
			 * } else {
			 */
		b = cDao.updateCategory(id, category, pathName, materialname, detail);
		System.out.println("name" + materialname);
		/* } */
		// 如果修改成功
		if (b) {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('上传成功')</script>");
		} else {
			response.getWriter().print("<script languge='javascript'>history.go(-1);alert('添加失败，请重新添加')</script>");
		}
	}
}

package com.sist.gj.control;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sist.gj.common.RandomNum;
import com.sist.gj.common.StringUtill;
import com.sist.gj.service.MypageSvc;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.UserVO;

@Controller
public class MypagePictureCtrl {
	@Autowired
	private MypageSvc mypageSvc;
	
	private String UPLOAD_ROOT = "";
	private RandomNum random = new RandomNum();
	private static final String VIEW_UPDATE_USER="mypageUser/UserInfoUpdate";
	Logger log = LoggerFactory.getLogger(this.getClass());
	/**
	 * D:\\sh_file 폴더하위폴더생성
	 * 방법 : 년도별/월별 폴더구조
	 * 예시 : 2018/11
	 * @param multipartReq 
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws DataAccessException
	 */
	@RequestMapping(value="/common/file.do",method=RequestMethod.POST,produces="application/json;charset=utf8")
	@ResponseBody
	public String uploadSubmit(MultipartHttpServletRequest mReq, HttpSession ses, Model model) 
			throws IOException, DataAccessException {
		log.debug("1. uploadSubmit Method check");
		String path = mReq.getSession().getServletContext().getRealPath("/");
		UPLOAD_ROOT = path+"resources/images";
		log.info("-------------------------------");
		log.info("path : "+path);
		log.info("-------------------------------");
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		
		List<PictureVO> list = new ArrayList<PictureVO>();
		
		String uploadPath = "";
		int flag =0;
		
		File fileRootDir = new File(UPLOAD_ROOT);
		if(fileRootDir.isDirectory() == false) {
			fileRootDir.mkdirs();
		}
		
		uploadPath = UPLOAD_ROOT;
		String yyyy = StringUtill.currDate("yyyy");
		uploadPath += File.separator+yyyy;
		
		File yyyyDir = new File(uploadPath);
		if(yyyyDir.isDirectory() == false) {
			yyyyDir.mkdirs();
		}
		
		String mm = StringUtill.currDate("MM");
		uploadPath += File.separator+mm;
		
		File mmDir = new File(uploadPath);
		if(mmDir.isDirectory() == false) {
			mmDir.mkdirs();
		}
		
		//저장파일ID : yyyyMMddHHmmSS + 32bit난수
		String fileId = "";
		if("".equals(fileId)) {
			fileId = random.makeRandom();
		}
		
		Iterator<String> files = mReq.getFileNames();
		
		int fileLength = 1;
		while(files.hasNext()) {
			PictureVO fileVO = new PictureVO();
			String uploadFileName = files.next();
			String orgFileName = "";
			String saveFileName = "";
			String ext = "";
			long fileSize = 0;
			
			log.debug("2. file uploadFileName : "+uploadFileName);
			MultipartFile mFile = mReq.getFile(uploadFileName);
			
			//원본파일명
			orgFileName = mFile.getOriginalFilename();
			log.debug("3. file orgFileName : "+orgFileName);
			
			//확장자
			if(null == orgFileName  ||  orgFileName.equals("")) {
				continue;
			}
			
			if(orgFileName.lastIndexOf(".") > -1) {
				ext = orgFileName.substring(orgFileName.lastIndexOf("."));
			}
			
			String lowExt = ext.toLowerCase();
			if(!(lowExt.equals(".jpg")  ||  lowExt.equals(".png")  ||  lowExt.equals(".jpeg"))) {
				break;
			}
			
			log.debug("4. file ext : "+ext);
			
			//파일사이즈
			fileSize = mFile.getSize();
			log.debug("5. file fileSize : "+fileSize);
			
			log.debug("6. file fileId : "+fileId);
			
			//저장파일명 : fileId+확장자명
			saveFileName = fileId+""+ext;
			log.debug("file saveFileName : "+saveFileName);
			
			fileVO.setUserId(sessionVO.getUserId());
			fileVO.setpFlNm(orgFileName);
			fileVO.setpSvNm(fileId);
			fileVO.setpFlSz(fileSize+"");
			fileVO.setpFlPt(uploadPath);
			fileVO.setpFlTp(ext);
			fileVO.setRegId(sessionVO.getUserId());
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			log.info("VO : "+fileVO);
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			if(null != orgFileName  &&  !uploadPath.equals("")) {
				//mutipart  ->  uploadPath전송
				mFile.transferTo(new File(uploadPath+File.separator+saveFileName));
				list.add(fileVO);
				flag = 1;
			}
		}
		log.debug("7. file list : "+list);
		
		log.info("+++++++++++++++++++++++++=");
		log.info("real Path"+UPLOAD_ROOT);
		log.info("+++++++++++++++++++++++++=");
		
		if(null != list  &&  list.size()>0) {
//			flag = this.mypageSvc.addPic(list.get(0));
		}
		
		log.debug("8. do_saveTx flag : "+flag);
		
		JSONObject object = new JSONObject();
		if(flag > 0) { 
			object.put("flag",flag);
			object.put("msg",list.get(0).getpFlNm());
			ses.setAttribute("pictureVO", list.get(0));
		}else {
			object.put("flag",flag);
			object.put("msg","등록 실패. 이미지파일이 맞는지 확인해주세요");
		}
		
		String jsonData = object.toJSONString();
		return jsonData;
	}
}

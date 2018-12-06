package com.sist.gj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

public class SignUpDaoImple implements SignUpDao {

	@Override
	public int update(UserVO userVO) throws SQLException {
		 	      
	      Connection   connection = null;
	      PreparedStatement pstmt = null;
	      int flag = -1;
	      
	      try {
//	          connection = ConnectionControl.getConnection();
	          
	          StringBuilder sb = new StringBuilder();
	          
	      sb.append(" INSERT INTO users     ( 	  \n");
	      sb.append("     userId          ,       \n");
	      sb.append("     userPasswd      ,       \n");
	      sb.append("     userNick        ,       \n");
	      sb.append("     userName        ,       \n");
	      sb.append("     userPhone	      ,       \n");
	      sb.append("     userAdd  	      ,       \n");
	      sb.append("     userPassQ	      ,       \n");
	      sb.append("     userPassA	      ,       \n");
	      sb.append("     userPhone	      ,       \n");
	    //  sb.append("   userLevel	      ,       \n");
	      sb.append("     regId			  ,       \n");
	      sb.append("     regDt			  ,       \n");
	      sb.append("     modId			  ,       \n");
	      sb.append("     modDt			  ,       \n");
	      sb.append("    ) VALUES (               \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     sysdate,                \n");
   		  sb.append("     ?,                      \n");
   		  sb.append("     sysadate,               \n");
   		  sb.append(" )                   		  \n");
   		  
   		  pstmt = connection.prepareStatement(sb.toString());
   		  
   	      pstmt.setString(1, userVO.getUserId());      
   	      pstmt.setString(2, userVO.getUserPasswd());    
   	      pstmt.setString(3, userVO.getUserNick());      
   	      pstmt.setString(4, userVO.getUserName());      
   	      pstmt.setString(5, userVO.getUserPhone());  	  
   	      pstmt.setString(6, userVO.getUserAdd());    	  
   	      pstmt.setString(7, userVO.getUserPassQ());  	  
   	      pstmt.setString(8, userVO.getUserPassA());  	  
   	      pstmt.setString(9, userVO.getUserPhone());  	  
   	      //pstmt.setInt(10,userVO.getUserLevel());  
   	    		  
   		  flag = pstmt.executeUpdate();
   		  
	      }catch(SQLException e){
	          e.printStackTrace();
	     
	       }
   		  
		return flag ;
	}

	@Override
	public int add(JasoVO jasoVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> selectAll() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> do_retrieve(SearchVO searchVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO select(UserVO userVO) throws ClassNotFoundException, SQLException {
		  Connection connection = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	     
	      
	      try {
	         StringBuilder sb = new StringBuilder();
	         
	         sb.append("SELECT userId      \n");
	         sb.append("  FROM users        \n");
	         sb.append(" WHERE userId = ?  \n");
	         
	      }catch(SQLException sql) {  
	    	  sql.printStackTrace();
	      }
	      
	      
	      
		return null;
	}

}

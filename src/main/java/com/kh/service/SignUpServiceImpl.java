package com.kh.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.kh.dao.SignUpDAO;
import com.kh.vo.UserVO;


@Service
public class SignUpServiceImpl implements SignUpService {

	//DB와 연결 (의존주입)
	@Inject
	private SignUpDAO signUpDao;
	
	 //회원가입
	   @Override
	   public void insertSignUp(UserVO userVo) {
	      //컨트롤러 -> 서비스 호출 -> DAO 호출 -> Mapper -> DB
	      System.out.println("S : 회원가입동작");
	      signUpDao.insertSignUp(userVo);
	   }

	//로그인기능
	@Override
	public UserVO loginSignUp(UserVO userVo) {
		System.out.println("S : 컨트롤러에서 호출받으면 필요한 정보를 받아서 DAO로 전달");
		UserVO returnVO = null;
		try {
			returnVO = signUpDao.readSignUpWithIDPW(userVo.getId(), userVo.getPw());
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null; //실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
		}
		return returnVO; //null이 반환되면 앞의 코드가 문제가 있다는 것을 바로 알수있다.
	}	
	
	//중복 아이디 찾기
	   @Override
	   public UserVO readSignUp(String id) throws Exception {
//	       l.info("service-메소드");
//	       l.info("123123==",id);
	      return    signUpDao.readSignUp(id);
	   }
}
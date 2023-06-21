package service;

import java.util.List;

import model.User;

//오라클에 맞게 메소드 파라미터 수정하면 될듯
public interface LoginService {
	
	//회원가입
	public int insertUser(User user);
	
	public List<String> selectClub(String userId);
	public User selectUser(User user) throws Exception;
	public User selectUserByPhone(String userPhoneNumber, String userPw) throws Exception;
	public User selectUserByUserId(String userId);
	
	public List<User> getAllUsers();
}

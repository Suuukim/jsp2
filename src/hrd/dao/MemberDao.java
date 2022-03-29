package hrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hrd.vo.Member;
import mybatis.SqlSessionBean;

public class MemberDao {
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static MemberDao dao = new MemberDao();
	private MemberDao() {  }
	public static MemberDao getInstance() {
		return dao;
	}

	public int getNextSeq() {
		SqlSession mapper = factory.openSession();
		int result = mapper.selectOne("getNextSeq");
		mapper.close();
		return result;
	}
	//insert(),update(),delete() 메소드는 member.xml에 resultType이 없이
	// 실행결과 반영된 행의 개수를 리턴합니다.
	public int insert(Member vo) {
		SqlSession mapper = factory.openSession();
		int result  = mapper.insert("insert", vo);	
		mapper.commit();     //mybatis SqlSession객체는 기본동작이 auto commit 이 아닙니다.
		mapper.close();
		return result;
	}
	//commit 해야할 명령어 : insert, update ,delete
	public int update(Member vo) {
		SqlSession mapper =factory.openSession();
		int result = mapper.update("update", vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public Member selectOne(int custno) {
		SqlSession mapper =factory.openSession();
		//리턴을 받는 메소드
		Member result = mapper.selectOne("selectOne", custno);   
		//select 결과행 1개이면 selectOne(기본키 컬럼 조건 또는 unique와 not null 적용 컬럼 조건)
		mapper.close();
		return result;
	}
	
	public List<Member> selectAll(){
		SqlSession mapper = factory.openSession();
		List<Member> result=mapper.selectList("selectAll");  //select 결과행 1개 이상일수 있다면 selectList
		mapper.close();
		return result;
	}
	
	public List<Member> searchName(String name){
		SqlSession mapper = factory.openSession();
		//selectList메소드의 첫번째 인자값은 member.xml 파일에서 실행할 sql 태그의 id값
		//				   두번째 인자값은 sql실행에 필요한 파라미터값.
		List<Member> result = mapper.selectList("searchName", name);
		mapper.close();
		return result;
	}
}
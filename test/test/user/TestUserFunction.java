package test.user;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import com.easyvote.dto.BreifVoteDto;
import com.easyvote.dto.CarouselVoteDto;
import com.easyvote.function.UserFunction;
import com.easyvote.function.impl.UserFunctionImpl;

public class TestUserFunction {
	static private UserFunction fun; 
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		fun=new UserFunctionImpl();
	}

	@Test
	public void testLoadCarouselData() throws Exception{
		List<CarouselVoteDto> dtos=fun.loadCarouseVotes();
		assertEquals("未找到6个首页轮播资源", 6, dtos.size());
	}
	@Test
	public void testLoadIndexPageNewVotes() throws Exception{
		List<BreifVoteDto> dtos=fun.loadNewVotes("10", "");
		assertTrue("未加载到最新的投票数据",dtos.size()!=0);
	}
}

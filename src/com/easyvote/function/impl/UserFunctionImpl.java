/**
 * 
 */
package com.easyvote.function.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.easyvote.dto.CarouselVoteDto;
import com.easyvote.function.UserFunction;

/**
 * @author ben
 * 
 */
public class UserFunctionImpl extends CommonFunctionImpl implements
		UserFunction {

	@Override
	public Map<String, Object> loadIndexPage() throws Exception {
		List<CarouselVoteDto> carouselVotes= this.loadCarouseVotes();
		Map<String,Object> result=new HashMap<>();
		result.put("carouselVotes", carouselVotes);
		return result;
	}

}

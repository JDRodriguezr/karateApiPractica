package com.api.frameworkTmJdrr.post_requests;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPostRunner {
	@Test	
	public Karate runTest() {
		return Karate.run("postTests").relativeTo(getClass());
	}
}

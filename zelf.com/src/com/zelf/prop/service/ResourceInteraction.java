package com.zelf.prop.service;

import com.zelf.prop.model.Resource;

public interface ResourceInteraction {
	
	public Resource resourceLogin(String username, String password);
	public boolean resourceRegisteration(Resource resource);
	public int resourceUpdate(Resource resource);

}

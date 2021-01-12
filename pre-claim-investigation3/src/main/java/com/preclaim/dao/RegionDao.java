package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Group;
import com.preclaim.models.Region;
import com.preclaim.models.RegionList;

public interface RegionDao {

	public String create_region(Region region);
	public List<RegionList> pending_region();
	public List<RegionList> active_region();

}

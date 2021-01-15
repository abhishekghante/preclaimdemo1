package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.Region;
import com.preclaim.models.RegionList;

public interface RegionDao {

	public String create_region(Region region);
	public List<RegionList> region_list(int status);
	public String deleteRegion(int regionId);
	public String updateRegion(int regionId, String region_name);
    public String updateRegionStatus(int RegionId,int status);
}

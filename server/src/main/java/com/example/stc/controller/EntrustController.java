package com.example.stc.controller;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.stc.domain.Entrust;
import com.example.stc.repository.EntrustRepository;

@RestController
@RequestMapping(path="/api") 
public class EntrustController {

	@Autowired 
	private EntrustRepository entrustRepository;

	// 客户：/api/customers/{cid}/...

	/**
	 * 查看全部委托
	 */
	@GetMapping(path="/api/customers/{cid}/projects")
	public @ResponseBody 
	List<Resource<Entrust>> getAllEntrust(@PathVariable String cid) {
		return null;
	}
	
	/**
	 * 新建委托
	 */
	@GetMapping(path="/api/customers/{cid}/projects")
	public @ResponseBody 
	Entrust addNewEntrust(@PathVariable String cid, @RequestBody Entrust entrust) {
		return null;
	}

	/**
	 * 查看单个委托
	 */
	@GetMapping(path="/api/customers/{cid}/projects/{pid}/entrust")
	public @ResponseBody 
	Resource<Entrust> getOneEntrust(@PathVariable String cid, @PathVariable String pid) {
		return null;
	}

	/**
	 * 修改单个委托
	 */
	@GetMapping(path="/api/customers/{cid}/projects/{pid}/entrust")
	public @ResponseBody 
	Entrust replaceEntrust(@PathVariable String cid, @PathVariable String pid, @RequestBody Entrust entrust) {
		return null;
	}
	
	/**
	 * 删除单个委托
	 */
	@GetMapping(path="/api/customers/{cid}/projects/{pid}/entrust")
	public @ResponseBody 
	Entrust deleteEntrust(@PathVariable String cid, @PathVariable String pid) {
		return null;
	}
}

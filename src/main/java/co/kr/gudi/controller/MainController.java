package co.kr.gudi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.kr.gudi.service.MainService;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	MainService mainService;

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}

	@GetMapping(value = "/search.do")
	public ModelAndView search(String id) {
		logger.info("search.do Req /param id = " + id);

		return mainService.search(id);
	}

	@GetMapping(value = "/result.go")
	public ModelAndView resultGo(String projectName, String id) {
		logger.info("result.go Req / param projectName = " + projectName);
		logger.info("result.go Req / param id = " + id);
		return mainService.result(projectName,id);
	}
}

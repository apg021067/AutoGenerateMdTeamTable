package co.kr.gudi.service;

import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;

import co.kr.gudi.dto.RepoDTO;
import co.kr.gudi.dto.RepoMemberDTO;
import reactor.core.publisher.Flux;

@Service
public class MainService {

	private String rootUrl = "https://api.github.com";

	Logger logger = LoggerFactory.getLogger(getClass());

	// 검색
	public ModelAndView search(String id) {
		// 이동할 page
		String page = "main";
		boolean result = false;
		ModelAndView mav = new ModelAndView();
		// 요청할 url
		String urlString = "/users/" + id + "/repos";
		// 1. 어디로 보낼지
		WebClient client = WebClient.create(rootUrl);
		// 2. 전송 방식 + 상세 URL + 전송 타입
		Flux<RepoDTO> flux = client.get().uri(urlString).retrieve().bodyToFlux(RepoDTO.class);

		try {
			List<RepoDTO> list = flux.toStream().collect(Collectors.toList());
			result = true;
			page = "repoList";
			mav.addObject("list", list);
		} catch (Exception e) {
			logger.error("요청 중 오류 발생");
		}
		mav.addObject("result", result);
		mav.addObject("id", id);
		mav.setViewName(page);
		return mav;
	}

	// 결과
	public RepoMemberDTO[] result(String projectName, String id) {
		String urlString = rootUrl + "/repos/" + id + "/" + projectName + "/contributors";
		RestTemplate restTemplate = new RestTemplate();
		RepoMemberDTO[] members = restTemplate.getForObject(urlString, RepoMemberDTO[].class);

		return members;
	}

}

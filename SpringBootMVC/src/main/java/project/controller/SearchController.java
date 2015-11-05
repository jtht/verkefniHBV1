package project.controller;

/**
 * Created by johannesthorkell on 3.10.2015.
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import project.service.MediaFileRepository;
import org.springframework.ui.Model;

@Controller
public class SearchController {

    @Autowired
    private MediaFileRepository repository;

    @RequestMapping(value = "/searchmedia", method = RequestMethod.GET)
    public String searchForm() {
        return "search";
    }

    @RequestMapping(value = "/searchmedia", method = RequestMethod.POST)
    public String searchSubmit(@RequestParam("search") String tag, Model model) {
        model.addAttribute("mediaFiles", repository.findByTag(tag));
        return "search";
    }
}

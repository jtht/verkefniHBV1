package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import project.service.MediaFile;
import project.service.MediaFileRepository;

import java.util.List;

/**
 * Created by johannesthorkell on 13.10.2015.
 */

@Controller
@RequestMapping("/media")
public class MediaController {

    @Autowired
    private MediaFileRepository repository;

    @RequestMapping("/{media}")
    public String newMedia(@PathVariable String media, Model model) {
        List<MediaFile> nameExists = repository.findByName(media);
        if (nameExists.size() > 0) {
            MediaFile mediaFile = nameExists.get(0);
            String name = mediaFile.getName();
            String type = mediaFile.getType();
            model.addAttribute("image", name + type);
            return "media";
        }
        return "error";
    }
}

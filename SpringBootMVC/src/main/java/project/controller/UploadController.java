package project.controller;

/**
 * Created by johannesthorkell on 3.10.2015.
 */

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import project.service.MediaFile;
import project.service.MediaFileRepository;

@Controller
public class UploadController {
    // path þar sem uploadaðar skrár eru vistaðar í skráarkerfi
    private String PATH = "/Users/johannesthorkell/Developer/spring_prufa/SpringBootMVC/target/mediaFiles/";
    private int randomLength = 8;

    @Autowired
    private MediaFileRepository repository;

    @RequestMapping(value = "/uploadmedia", method = RequestMethod.GET)
    public String uploadForm() {
        return "upload";
    }

    // uploadSubmit tekur við lista af files, tags og types úr post request frá /uploadmedia.
    // uploadSubmit vistar hverja file í skrárkerfi með slembi nafni og svo slóðinna, nafnið,
    // tags og type skránna í gagnagrunni.
    @RequestMapping(value = "/uploadmedia", method = RequestMethod.POST)
    public String uploadSubmit(@RequestParam(value="files[]") MultipartFile[] files,
                               @RequestParam("tags[]") String[] tags, @RequestParam("types[]") String[] types)
    {
        String[] tagsArray;
        MultipartFile file;
        String name;
        String tag;
        String type;

        for (int i = 0; i < files.length; i++) {
            file = files[i];
            tagsArray = tags[i].split("\\s+");
            type = types[i].toLowerCase();
            name = randomString(randomLength);
            List<MediaFile> nameExists = repository.findByName(name);
            while (nameExists.size() > 0) {
                name = randomString(randomLength);
                nameExists = repository.findByName(name);
            }

            if (!file.isEmpty()) {
                try {
                    byte[] bytes = file.getBytes();
                    BufferedOutputStream stream =
                            new BufferedOutputStream(new FileOutputStream(new File(PATH + name + type)));
                    stream.write(bytes);
                    stream.close();
                    for (int j = 0; j < tagsArray.length; j++) {
                        tag = tagsArray[j].toLowerCase();
                        repository.save(new MediaFile(name, tag, PATH, type));
                    }
                    System.out.println("Success!");
                } catch (Exception e) {
                    System.out.println("Failure... " + e.getMessage());
                }
            } else {
                System.out.println("file is empty");
            }
        }
        return "upload";
    }

    private final String randomAlphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private Random rnd = new Random();
    // Skilar streng af lengd len samsettan af handahófskenndum stöfum úr randomAlphabet
    private String randomString( int len ){
        StringBuilder sb = new StringBuilder( len );
        for( int i = 0; i < len; i++ )
            sb.append(randomAlphabet.charAt(rnd.nextInt(randomAlphabet.length()) ) );
        return sb.toString();
    }
}

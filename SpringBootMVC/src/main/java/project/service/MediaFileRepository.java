package project.service;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import project.service.MediaFile;

public interface MediaFileRepository extends CrudRepository<MediaFile, Long> {

    List<MediaFile> findByTag(String tag);
    List<MediaFile> findByName(String name);
}

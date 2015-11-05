package project.service;

/**
 * Created by johannesthorkell on 3.10.2015.
 */

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MediaFile {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String name;
    private String tag;
    private String resource;
    private String type;

    protected MediaFile() {}

    public MediaFile(String name, String tag, String resource, String type) {
        this.name = name;
        this.tag = tag;
        this.resource = resource;
        this.type = type;
    }

    public String getName() { return name; }
    public String getTag() {
        return tag;
    }
    public String getResource() {
        return resource;
    }
    public String getType() {
        return type;
    }


    @Override
    public String toString() {
        return String.format(
                "MediaFile[id=%d, name='%s', tag='%s', resource='%s', type='%s']",
                id, name, tag, resource, type);
    }

}

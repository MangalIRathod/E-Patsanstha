package com.codeft.FileUploading;

import java.io.*;
import java.nio.file.*;
 
import org.springframework.web.multipart.MultipartFile;
 
public class FileUploadUtil {
     
    public static String saveFile(String uploadDir, String fileName,
            MultipartFile multipartFile) throws IOException {
    	
    	String string ="Success";
        Path uploadPath = Paths.get(uploadDir);
         
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
         
        try (InputStream inputStream = multipartFile.getInputStream()) {
            Path filePath = uploadPath.resolve(fileName);
            System.out.println("photo File Path is:  "+filePath);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } 
        catch (IOException ioe) {        
            System.out.println("Could not save image file: " + fileName);
            string = "Fail";
        }
        return string;
    }
}
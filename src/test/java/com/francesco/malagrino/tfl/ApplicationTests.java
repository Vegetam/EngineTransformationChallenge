package com.francesco.malagrino.tfl;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.francescomalagrino.tfl.Application;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;

@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
@ActiveProfiles("test")
@SpringBootTest(classes = Application.class)
public class ApplicationTests {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testAllTrains() throws JsonProcessingException, Exception{
        mockMvc.perform(get("/api/trains"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$[0].stationName").exists());
       
    }
    
    @Test
    public void testTrainsOnPlatform() throws JsonProcessingException, Exception{
        mockMvc.perform(get("/api/trains/Platform 2"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$[0].platformName").exists())
                .andExpect(jsonPath("$[0].stationName").exists());
    }
    
    @Test
    public void testTrainsByPlatform() throws JsonProcessingException, Exception{
        MvcResult result = mockMvc.perform(get("/api/trainsByPlatform"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isMap())
                .andReturn();
        String content =result.getResponse().getContentAsString();
        Gson gson = new Gson();
        @SuppressWarnings({ "rawtypes", "serial" })
		java.lang.reflect.Type typeOfT = new TypeToken<Map>() {
        }.getType();
        Map<String, String> map = gson.fromJson(content, typeOfT);
        assertThat(map.size()).isGreaterThanOrEqualTo(2);
        
    }
}

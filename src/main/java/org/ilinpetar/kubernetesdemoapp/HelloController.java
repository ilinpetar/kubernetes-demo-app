package org.ilinpetar.kubernetesdemoapp;

import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Counter;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    private final Counter counter;

    public HelloController(MeterRegistry meterRegistry) {
        counter = Counter.builder("req.counter.hello")
            .description("a number of requests to /hello endpoint")
            .register(meterRegistry);
   }

    @RequestMapping("/hello")
    public ResponseEntity<String> hello() {
        counter.increment();
        return ResponseEntity.ok("Howdy!");
    }
}

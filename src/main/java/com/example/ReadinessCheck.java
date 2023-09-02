package com.example;

import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.Readiness;
import org.eclipse.microprofile.health.Startup;

@Startup
@Readiness
public class ReadinessCheck implements HealthCheck {

    public static boolean READY = false;

    @Override
    public HealthCheckResponse call() {
        System.out.println("Application is ready");
        return HealthCheckResponse.named("Application is ready").status(READY).build();
    }

}

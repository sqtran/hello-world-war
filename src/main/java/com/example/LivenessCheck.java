package com.example;

import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.Readiness;

@Readiness
public class LivenessCheck implements HealthCheck{

    public static boolean ALIVE = false;

    @Override
    public HealthCheckResponse call() {
        System.out.println("Application is alive");
        return HealthCheckResponse.named("Application is alive").status(ALIVE).build();
    }

}

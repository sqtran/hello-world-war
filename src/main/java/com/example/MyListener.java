package com.example;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        ReadinessCheck.READY = true;
        LivenessCheck.ALIVE = true;

        System.out.println("Context Initialized");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        ReadinessCheck.READY = false;
        LivenessCheck.ALIVE = false;

        System.out.println("Context Destroyed");

        // Stop accepting new requests

        if (areThreadsRunning()) {
            // There are running threads, take appropriate action
            System.out.println("There are running threads. Cannot shut down.");
            // You can choose to log an error, throw an exception, or handle it according to your application's needs
            // To prevent shutdown, you can also return or call System.exit(1)

        } else {
            // No running threads, perform cleanup tasks, shutdown services, etc.
            System.out.println("No running threads. Proceeding with shutdown...");
        }
    }

    private boolean areThreadsRunning() {
        ThreadGroup threadGroup = Thread.currentThread().getThreadGroup();
        ThreadGroup rootGroup = getRootThreadGroup(threadGroup);
        int threadCount = rootGroup.activeCount();
        Thread[] threads = new Thread[threadCount];
        rootGroup.enumerate(threads, true);

        for (Thread thread : threads) {
            if (thread.isAlive()) {
                return true;
            }
        }

        return false;
    }

    private ThreadGroup getRootThreadGroup(ThreadGroup threadGroup) {
        ThreadGroup parentGroup = threadGroup.getParent();
        if (parentGroup == null) {
            return threadGroup;
        }
        return getRootThreadGroup(parentGroup);
    }

  }
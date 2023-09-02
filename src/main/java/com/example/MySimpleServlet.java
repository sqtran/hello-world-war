package com.example;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MySimpleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.getWriter().println("<h1>Hello, World! " + request.getLocalName() + " </h1>");

        //Map<Thread, StackTraceElement[]> threadMap = Thread.getAllStackTraces();

        // for (Map.Entry<Thread, StackTraceElement[]> entry : threadMap.entrySet()) {
        //     Thread thread = entry.getKey();
        //     StackTraceElement[] stackTrace = entry.getValue();

        //     System.out.println("Thread: " + thread.getName() + ", ID: " + thread.getId() + ", State: " + thread.getState());
        //     for (StackTraceElement stackTraceElement : stackTrace) {
        //         System.out.println("\t" + stackTraceElement.toString());
        //     }
        //     System.out.println();
        // }

        try {
            Thread.sleep(20000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
package net.matskevich.taskapp.service;

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}

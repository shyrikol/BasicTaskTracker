package net.matskevich.taskapp.service;

import net.matskevich.taskapp.model.User;

import java.util.List;


public interface UserService {

    void save(User user);

    User findByUsername(String username);

    List<User> listUsers();

}

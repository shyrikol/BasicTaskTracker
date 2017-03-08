package net.matskevich.taskapp.service;

import net.matskevich.taskapp.dao.RoleDao;
import net.matskevich.taskapp.dao.UserDao;
import net.matskevich.taskapp.model.Role;
import net.matskevich.taskapp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        if (user.getManager()) {
            roles.add(roleDao.getOne(2L));
        } else {
            roles.add(roleDao.getOne(1L));
        }
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public List<User> listUsers() {
        return userDao.findAll();
    }
}

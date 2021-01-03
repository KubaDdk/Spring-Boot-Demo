package com.example.service;

import com.example.model.Person;
import com.example.repository.PersonRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonService {

    private final PersonRepository personRepository;

    public PersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public List<Person> getPersonList() {
        return personRepository.findAll();
    }

//    public Person getPerson(Long id) {
//        return personRepository.find
//    }

    public void deletePerson(Long id) {
        personRepository.delete(id);
    }


}

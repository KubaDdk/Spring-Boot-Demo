package com.example.contoller;

import com.example.model.Person;
import com.example.repository.PersonRepository;
import com.example.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
public class PersonList {

    @Autowired
    PersonRepository personRepository;

//    @Autowired
//    PersonService personService;

    @RequestMapping(value = { "/personList"}, method = RequestMethod.GET)
    public String viewPersonList(Model model) {
        List<Person> list = personRepository.findAll();
        model.addAttribute("person", list);
        return "persons/personList";
    }

    @RequestMapping(value = { "/addNewPerson"}, method = RequestMethod.GET)
    public String viewAddNewPerson() {

        return "persons/addNewPerson";
    }

    @RequestMapping(value = { "/addNewPerson"}, method = RequestMethod.POST)
    public RedirectView postNewPerson(@ModelAttribute Person newPerson) {

        personRepository.save(newPerson);


        return new RedirectView("/personList");
    }


    @RequestMapping(value = { "/editPerson/{id}"}, method = RequestMethod.GET)
    public String editPersonView(@PathVariable("id") Long id, Model model) {
        Person person = personRepository.findById(id);
        model.addAttribute("person", person);
        return "persons/editPerson";
    }

    // save edit person
    @RequestMapping(value = {"/personList/{id}"}, method = RequestMethod.POST)
    public RedirectView saveEditPerson(@ModelAttribute Person newPerson, @PathVariable("id") Long id) {
        personRepository.save(newPerson);
        return new RedirectView("/editPerson/{id}");
    }

    // delete - post
    @RequestMapping(value = {"/editPerson/{id}"}, method = RequestMethod.POST)
    public RedirectView deletePerson(@PathVariable("id") Long id) {
        personRepository.delete(id);
        return new RedirectView("/personList");
    }


}

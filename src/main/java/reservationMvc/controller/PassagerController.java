package reservationMvc.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import reservationSpring.model.Passager;
import reservationSpring.repository.PassagerRepository;

@Controller
@RequestMapping("/passager")
public class PassagerController {

	@Autowired
	private PassagerRepository passagerRepository;

	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("passager", passagerRepository.findAll());
		return "passager/list";
	}

	@GetMapping("delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		passagerRepository.deleteById(id);
		return "redirect:/passager/list";
	}

	private String goEdit(Passager passager, Model model) {
		model.addAttribute("passager", passager);
		return "passager/edit";

	}

	private String save(Passager passager, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return goEdit(passager, model);
		}
		passagerRepository.save(passager);
		return "redirect:/passager/list";
	}

	@GetMapping("edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Optional<Passager> opt = passagerRepository.findById(id);
		Passager p = null;
		if (opt.isPresent()) {
			p = opt.get();
		} else {
			p = new Passager();
		}
		model.addAttribute("passager", p);
		return goEdit(p, model);
	}

	@GetMapping("/addPassager")
	public String addPassager(@Valid @ModelAttribute("passager") Passager passager, BindingResult br, Model model) {
		return goEdit(new Passager(), model);
	}

	@PostMapping("/savePassager")
	public String savePassager(@Valid @ModelAttribute("passager") Passager passager, BindingResult br, Model model) {
		return save(passager, br, model);
	}

}

package reservationMvc.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import reservationSpring.model.Aeroport;
import reservationSpring.repository.AeroportRepository;

@Controller
@RequestMapping("/aeroport")
public class AeroportController {

	@Autowired
	private AeroportRepository aeroportRepository;
	
	@GetMapping("/listAeroport")
	public String list(Model model) {
		model.addAttribute("aeroports", aeroportRepository.findAll());
		return "aeroport/listAeroport";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam(name = "idAeroport", required = true) Long idAeroport) {
		aeroportRepository.deleteById(idAeroport);
		;
		return "redirect:/aeroport/listidAeroport";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam(name = "idAeroport", required = true) Long idAeroport, Model model) {
		Optional<Aeroport> opt = aeroportRepository.findById(idAeroport);
		Aeroport a = null;
		if (opt.isPresent()) {
			a = opt.get();
		} else {
			a = new Aeroport();
		}
		return goEdit(a, model);
	}

	private String goEdit(Aeroport aeroport, Model model) {

		model.addAttribute("aeroport", aeroport);
		return "aeroport/editAeroport";
	}

	@GetMapping("/addAeroport")
	public String addAeroport(Model model) {
		return goEdit(new Aeroport(), model);
	}

	@PostMapping("/saveAeroport")
	public String saveAeroport(@ModelAttribute("aeroport") Aeroport aeroport, Model model) {
		return save(aeroport, model);
	}

	private String save(Aeroport aeroport, Model model) {

		aeroportRepository.save(aeroport);
		return "redirect:/aeroport/listAeroport";
	}

}

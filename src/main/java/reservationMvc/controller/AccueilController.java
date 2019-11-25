package reservationMvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import reservationSpring.model.Vol;

@Controller
@RequestMapping("/accueil")
public class AccueilController {
	
	@GetMapping("/listeClient")
	public String allerClients(Model model) {
		return "redirect:/client/list";
		
	}
	
	@GetMapping("/listeVol")
	public String allerVols(Model model) {
		return "redirect:/vol/list";
		
	}
	
	@GetMapping("/listePassager")
	public String allerPassagers(Model model) {
		return "redirect:/passager/list";
		
	}
	
	@GetMapping("/listeReservation")
	public String allerReservations(Model model) {
		return "redirect:/reservation/listReservation";
		
	}
	
	@GetMapping("/pageAccueil")
	public String accueil(Model model) {
		return "accueil/pageAccueil";
	}
	
	

}

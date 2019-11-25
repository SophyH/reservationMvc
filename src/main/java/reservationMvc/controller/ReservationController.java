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

import reservationSpring.model.Reservation;
import reservationSpring.repository.PassagerRepository;
import reservationSpring.repository.ReservationRepository;
import reservationSpring.repository.VolRepository;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private PassagerRepository passagerRepository;


	@Autowired
	private VolRepository  volRepository;

	@Autowired
	private ReservationRepository reservationRepository;
	
	@GetMapping("/listReservation")
	public String list(Model model) {
		model.addAttribute("reservations", reservationRepository.findAll());
		return "reservation/listReservation";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam(name = "idReservation", required = true) Long idReservation) {
		reservationRepository.deleteById(idReservation);;
	return "redirect:/reservation/listReservation";
      }

	@GetMapping("/edit")
	public String edit(@RequestParam(name = "idReservation", required = true) Long idReservation, Model model) {
		Optional<Reservation> opt = reservationRepository.findById(idReservation);
		Reservation r = null;
		if (opt.isPresent()) {
			r = opt.get();
		} else {
			r = new Reservation();
		}
		return goEdit(r, model);
	}
	
	private String goEdit(Reservation reservation, Model model) {
		model.addAttribute("passagers", passagerRepository.findAll());
		model.addAttribute("vols", volRepository.findAll());

		model.addAttribute("reservation", reservation);
		return "reservation/editReservation";
	}

	@GetMapping("/addReservation")
	public String addReservation(Model model) {
		return goEdit(new Reservation(), model);
	}

	@PostMapping("/saveReservation")
		public String saveReservation(@ModelAttribute("reservation") Reservation reservation,BindingResult br, Model model) {
		return save(reservation,br, model);
	}

	
	
	
	
	private String save(Reservation reservation, BindingResult br, Model model) {
		
		if (br.hasErrors()) {
			return goEdit(reservation, model);
		}

		if (reservation.getPassager() != null && reservation.getPassager().getIdPassager() == null) {
			reservation.setPassager(null);
		}
		if (reservation.getVols()!= null && reservation.getVols().getIdVol() == null) {
			reservation.setVols(null);
		}
		reservationRepository.save(reservation);
		return "redirect:/reservation/listReservation";
		}


}

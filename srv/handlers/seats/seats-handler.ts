import { SeatsRepository } from "../../repositories/seats-repository";

export class SeatsHandler {
  private readonly seatsRepository = new SeatsRepository();

  public fillAircraft() {
    this.seatsRepository.insertSeatsForAircraft([]);
  }
}

package jetbrains.mps.logic.reactor.constraint;

/*Generated by MPS */


public class PredicateSymbol extends Symbol {

  public PredicateSymbol(String id, int arity) {
    super(id, arity);
  }

  @Override
  public String toString() {
    return id() + "()/" + arity();
  }

}

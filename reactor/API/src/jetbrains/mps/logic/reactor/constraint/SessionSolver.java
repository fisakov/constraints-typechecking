package jetbrains.mps.logic.reactor.constraint;

/*Generated by MPS */

import java.util.Map;
import java.util.HashMap;

/**
 * Is used to provide an interface for handlers and solvers working together in a single session.
 */
public abstract class SessionSolver implements Instructible, Queryable {

  public void init(PredicateSymbol... predicateSymbols) {
    registerSymbols(null, predicateSymbols);
  }

  public void init(ComputingTracer computingTracer, PredicateSymbol... predicateSymbols) {
    registerSymbols(computingTracer, predicateSymbols);
  }

  @Override
  public boolean ask(PredicateSymbol predicateSymbol, Object... arg) {
    return solver(predicateSymbol).ask(predicateSymbol, arg);
  }

  @Override
  public void tell(Symbol symbol, Object... arg) {
    handler(symbol).tell(symbol, arg);
  }

  public Queryable lookupQueryable(Class<?> clazz) {
    for (Map.Entry<PredicateSymbol, Queryable> e : solvers.entrySet()) {
      Queryable queryable = e.getValue();
      if (clazz.isAssignableFrom(queryable.getClass())) {
        return queryable;
      }
    }
    return null;
  }

  public abstract Class<? extends Queryable> solverClass(PredicateSymbol predicateSymbol);

  protected abstract void registerSymbol(PredicateSymbol predicateSymbol, ComputingTracer computingTracer);

  protected void registerSolver(PredicateSymbol constraint, Queryable queryable) {
    solvers.put(constraint, queryable);
  }

  private Instructible handler(Symbol symbol) {
    return solver((PredicateSymbol) symbol);
  }

  private void registerSymbols(ComputingTracer computingTracer, PredicateSymbol... predicateSymbols) {
    for (PredicateSymbol symbol : predicateSymbols) {
      registerSymbol(symbol, computingTracer);
    }
  }

  private Queryable solver(PredicateSymbol predicateSymbol) {
    if (!(solvers.containsKey(predicateSymbol))) {
      throw new IllegalStateException("no handler: " + predicateSymbol);
    }
    return solvers.get(predicateSymbol);
  }

  private Map<PredicateSymbol, Queryable> solvers = new HashMap<PredicateSymbol, Queryable>();
}

package jetbrains.mps.logic.reactor.program;

/*Generated by MPS */

import java.util.List;
import java.util.Collection;

public abstract class Program {

  public abstract String name();


  public abstract Iterable<ConstraintSymbol> constraintSymbols();

  public abstract List<Class<?>> constraintArgumentTypes(ConstraintSymbol constraintSymbol);

  public abstract Iterable<PredicateSymbol> predicateSymbols();

  public abstract Iterable<Rule> rules();

  public abstract void addRule(Rule rule) throws InvalidRuleException;

  public abstract void addRules(Collection<? extends Rule> rules) throws InvalidRuleException;

}

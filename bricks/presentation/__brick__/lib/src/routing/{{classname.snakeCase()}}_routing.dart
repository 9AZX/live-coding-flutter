/// Port de navigation : la feature émet des intentions / résultats / fermetures,
/// l'implémentation côté composition les traduit en navigation concrète.
/// Nommer par évènement (`on…Requested`, `on…Successful`, `onDismiss…`),
/// jamais par impératif (`navigateTo…`, `push…`).
abstract interface class {{classname.pascalCase()}}Routing {
  // TODO: déclarer les évènements de navigation de cet écran.
}

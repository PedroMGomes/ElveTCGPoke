# Elve TCG Poke

This project is a challenge proposed by [Coletiv](https://coletiv.com/).

Use **Elve TCG Poke** to find Pokemon TCG cards from the https://docs.pokemontcg.io API.

It's possible to make requests without an API key, even thought it is recommended to use one.
To build the project with **your** API key, update the `.env` file accordingly.

Since this project uses [envify](https://pub.dev/packages/envify), the **build_runner** run task is required (only if using a custom API key).

1. `flutter pub get`
2. `flutter pub run build_runner run`
3. `flutter build <platform>`

### Video

https://youtu.be/oDZ05BoIgF8

### Features:
- Search by card name, partil name or type.
- Infinite Scroller with Paged Results.
- Image caching with [extended_image](https://pub.dev/packages/extended_image).
- Json Serialization.
- Grid responsive layout.
- Platform checker class (web vs native).
- State Restoration.

### State Management solutions used:
- [bloc](https://pub.dev/packages/bloc)
- [provider](https://pub.dev/packages/provider)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)


### Screenshots

![Screenshot_20210503-182736](https://user-images.githubusercontent.com/25188825/116910996-39a50d00-ac3e-11eb-952a-8d8561747ad8.png)
![Screenshot_20210503-182718](https://user-images.githubusercontent.com/25188825/116910992-390c7680-ac3e-11eb-83c0-bb13d8b0094f.png)
![Screenshot_20210503-182710](https://user-images.githubusercontent.com/25188825/116910989-3873e000-ac3e-11eb-9819-89dada1b8eff.png)
![Screenshot_20210503-182726](https://user-images.githubusercontent.com/25188825/116910994-39a50d00-ac3e-11eb-8984-46f78e09eb2b.png)
![Screenshot_20210503-182751](https://user-images.githubusercontent.com/25188825/116910973-36118600-ac3e-11eb-9d6b-dbfe57dd0623.png)
![Screenshot_20210503-182851](https://user-images.githubusercontent.com/25188825/116910985-37db4980-ac3e-11eb-894f-36099696174b.png)
![Screenshot_20210503-182817](https://user-images.githubusercontent.com/25188825/116910977-3742b300-ac3e-11eb-85bf-dc791fcf2e57.png)
![Screenshot_20210503-182824](https://user-images.githubusercontent.com/25188825/116910981-3742b300-ac3e-11eb-9015-62b4cb421d28.png)
![Screenshot_20210503-182832](https://user-images.githubusercontent.com/25188825/116910982-37db4980-ac3e-11eb-912f-ad8be409ab1a.png)
![Screenshot_20210503-182900](https://user-images.githubusercontent.com/25188825/116910987-3873e000-ac3e-11eb-9545-5cd608211f8b.png)

# Tiktok-Clone

With Tiktok-Clone, you can view you favourite videos.


Features:
used MVVM, Provider and dependency injection, you can dynamically decode models, handle network errors, and create dynamic requests for each client.


<!-- ![](assets/compare.jpeg) -->
<!-- ![](assets/screens/1-loading.png)
![](assets/screens/2-Video-playing.png) -->

<img src="assets/screens/1-loading.png" width="300" height="600"> <img src="assets/screens/2-Video-playing.png" width="300" height="600"> <img src="3-top-scroll.png" width="300" height="600"> <img src="4-full-scroll.png" width="300" height="600">


## Use Of

**Network Executer**

```dart
NetworkExecuter.execute<PostModel,List<PostModel>>(route: PlaceHolderClient.posts(), responseType: PostModel());
```

**Network Errors**

```dart
NetworkError.request({required DioError error})
NetworkError.type({String? error})
```

## Packages used
```yaml
freezed
json_annotation
dio
video_player
Get_it
Provider
```





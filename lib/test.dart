@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Row(
        children: [
          CarouselSlider.builder(
            itemCount: projectPhotoLists.length,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                setState(() {
                  visibleStartIndex = index;
                  visibleEndIndex = index + 3;
                });
              },
            ),
            itemBuilder: (context, index, _) {
              return Opacity(
                opacity:
                    (index >= visibleStartIndex && index <= visibleEndIndex)
                        ? 1.0
                        : 0.0,
                child: ProjectWidget(photoList: projectPhotoLists[index]),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: () {
                  if (visibleStartIndex > 0) {
                    setState(() {
                      visibleStartIndex--;
                      visibleEndIndex--;
                    });
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  if (visibleEndIndex < projectPhotoLists.length - 1) {
                    setState(() {
                      visibleStartIndex++;
                      visibleEndIndex++;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<List<String>> projectPhotoLists = [
    calcSumList,
    questRealmList,
    fakeLocList,
    beyondFirstList,
  ];
}
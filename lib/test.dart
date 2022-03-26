// Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Container(
//               height: size.height * .3,
//               width: size.width,
//               decoration: const BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                       top: 0,
//                       right: size.width * .02,
//                       child: PhysicalModel(
//                         shape: BoxShape.circle,
//                         color: Colors.grey.withOpacity(.5),
//                         elevation: 10,
//                         child: CircleAvatar(
//                           radius: size.height * .04,
//                           backgroundColor: Colors.orangeAccent,
//                           child: Text(
//                             widget.discountOffer.tag.toString(),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontFamily: 'Tajawal',
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       )),
//                   Positioned(
//                     top: size.height * .05,
//                     left: 0,
//                     child: Book_Picture(size: size, offer: widget.discountOffer, img: widget.discountOffer.img1,),),
//                   Positioned(
//                       top: 0,
//                       left: size.width * .27,
//                       child: Book_Picture(size: size, offer: widget.discountOffer, img: widget.discountOffer.img2,)),
//                   Positioned(
//                       bottom: 0,
//                       left: size.width * .2,
//                       child: Book_Picture(size: size, offer: widget.discountOffer, img: widget.discountOffer.img3,)),
//                   Positioned(
//                     right: size.height * .02,
//                     top: size.height * .1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(':تخفيض 10% علي ', style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Tajawal',
//                           color: Colors.orangeAccent,
//                         ),),
//                         SizedBox(height: 15,),
//                         Text('حلة جابر', style: kPageTitleStyle,textAlign: TextAlign.right,),
//                         SizedBox(height: 15,),
//                         Text('سيرة ناس',style: kPageTitleStyle,textAlign: TextAlign.right,),
//                         SizedBox(height: 15,),
//                         Text('سوق العناقريب',style: kPageTitleStyle,textAlign: TextAlign.right,),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10,),
//             Divider(color: Colors.orangeAccent,),
//           ],
//         ));


import 'package:beima/helpers/size_config.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class GlobalShimmerLoader extends StatelessWidget {
  const GlobalShimmerLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.heightAdjusted(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.heightAdjusted(10)),
              FadeShimmer(
                height: 8,
                width: double.infinity,
                highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                baseColor: const Color(0xffE6E8EB).withAlpha(50),
              ),
              SizedBox(height: SizeConfig.heightAdjusted(2)),
              FadeShimmer(
                height: 8,
                millisecondsDelay: 40,
                width: double.infinity,
                highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                baseColor: const Color(0xffE6E8EB).withAlpha(50),
              ),
              SizedBox(height: SizeConfig.heightAdjusted(2)),
              FadeShimmer(
                height: 8,
                millisecondsDelay: 40,
                width: double.infinity,
                highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                baseColor: const Color(0xffE6E8EB).withAlpha(50),
              ),
              Column(
                children: [
                  SizedBox(height: SizeConfig.heightAdjusted(5)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeShimmer(
                        height: 60,
                        width: 60,
                        highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                        baseColor: const Color(0xffE6E8EB).withAlpha(50),
                      ),
                      SizedBox(width: SizeConfig.widthAdjusted(2)),
                      Expanded(
                        child: Column(
                          children: [
                            FadeShimmer(
                              height: 8,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightAdjusted(5)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeShimmer(
                        height: 60,
                        width: 60,
                        highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                        baseColor: const Color(0xffE6E8EB).withAlpha(50),
                      ),
                      SizedBox(width: SizeConfig.widthAdjusted(2)),
                      Expanded(
                        child: Column(
                          children: [
                            FadeShimmer(
                              height: 8,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightAdjusted(5)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeShimmer(
                        height: 60,
                        width: 60,
                        highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                        baseColor: const Color(0xffE6E8EB).withAlpha(50),
                      ),
                      SizedBox(width: SizeConfig.widthAdjusted(2)),
                      Expanded(
                        child: Column(
                          children: [
                            FadeShimmer(
                              height: 8,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            FadeShimmer(
                              height: 8,
                              millisecondsDelay: 40,
                              width: double.infinity,
                              highlightColor:
                                  const Color(0xffF9F9FB).withAlpha(20),
                              baseColor: const Color(0xffE6E8EB).withAlpha(50),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.heightAdjusted(5)),
              FadeShimmer(
                height: 120,
                millisecondsDelay: 40,
                width: double.infinity,
                highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                baseColor: const Color(0xffE6E8EB).withAlpha(50),
              ),
              SizedBox(height: SizeConfig.heightAdjusted(5)),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 60,
                    width: 60,
                    highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                    baseColor: const Color(0xffE6E8EB).withAlpha(50),
                  ),
                  SizedBox(width: SizeConfig.widthAdjusted(2)),
                  Expanded(
                    child: Column(
                      children: [
                        FadeShimmer(
                          height: 8,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightAdjusted(5)),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 60,
                    width: 60,
                    highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                    baseColor: const Color(0xffE6E8EB).withAlpha(50),
                  ),
                  SizedBox(width: SizeConfig.widthAdjusted(2)),
                  Expanded(
                    child: Column(
                      children: [
                        FadeShimmer(
                          height: 8,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightAdjusted(5)),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 60,
                    width: 60,
                    highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                    baseColor: const Color(0xffE6E8EB).withAlpha(50),
                  ),
                  SizedBox(width: SizeConfig.widthAdjusted(2)),
                  Expanded(
                    child: Column(
                      children: [
                        FadeShimmer(
                          height: 8,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightAdjusted(5)),
              FadeShimmer(
                height: 120,
                millisecondsDelay: 40,
                width: double.infinity,
                highlightColor: Color(0xffF9F9FB),
                baseColor: Color(0xffE6E8EB),
              ),
              SizedBox(height: SizeConfig.heightAdjusted(5)),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 60,
                    width: 60,
                    highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                    baseColor: const Color(0xffE6E8EB).withAlpha(50),
                  ),
                  SizedBox(width: SizeConfig.widthAdjusted(2)),
                  Expanded(
                    child: Column(
                      children: [
                        FadeShimmer(
                          height: 8,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightAdjusted(5)),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 60,
                    width: 60,
                    highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                    baseColor: const Color(0xffE6E8EB).withAlpha(50),
                  ),
                  SizedBox(width: SizeConfig.widthAdjusted(2)),
                  Expanded(
                    child: Column(
                      children: [
                        FadeShimmer(
                          height: 8,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightAdjusted(5)),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 60,
                    width: 60,
                    highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                    baseColor: const Color(0xffE6E8EB).withAlpha(50),
                  ),
                  SizedBox(width: SizeConfig.widthAdjusted(2)),
                  Expanded(
                    child: Column(
                      children: [
                        FadeShimmer(
                          height: 8,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                        SizedBox(height: SizeConfig.heightAdjusted(2)),
                        FadeShimmer(
                          height: 8,
                          millisecondsDelay: 40,
                          width: double.infinity,
                          highlightColor: const Color(0xffF9F9FB).withAlpha(20),
                          baseColor: const Color(0xffE6E8EB).withAlpha(50),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
